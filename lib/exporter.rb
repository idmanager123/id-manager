require 'zip'
require 'digest'
require 'fileutils'
require 'open-uri'

class Exporter
  def self.export order_id
    order = Order.find order_id

    # Custom SHA_HASH for the folder
    sha_hash = Digest::SHA256.hexdigest "#{order.serializable_hash}"

    # the location where the zipfile will be saved
    folder ="#{Rails.root}/public/tmp/#{sha_hash}"

    if File.directory? folder
      FileUtils.remove_dir folder
    end
    Dir.mkdir folder

    # Copy original pictures to zip folder
    data = []
    order.customers.each do |c|
      data << self.copy_customer_images(c, folder)
    end

    #zip the file
    zipfile = "#{folder}/#{order.name}.zip"
    zf = ZipFileGenerator.new(folder, zipfile)
    zf.write

    return {data: data, url: zipfile}
  end
  # path is the folder its being saved to
  def self.copy_customer_images c, path
    vars= {:c => c, :path => path}
    # this is going to be where we save stuff to
    vars[:file_prefix] = "/#{c.full_name.squish.downcase.tr(" ","_")}"

    vars[:base_path] = "#{Rails.root}/public"

    if Rails.env.production?
      production_swag vars
    else
      development_swag vars
    end

    return c.to_string
  end

  private

  # Since we have different url setups on production
  # we need to specify whether we are getting something
  # from s3 or the localhost
  def self.production_swag vars
    vars[:photo_url] = "#{vars[:c].photo.url}".split('?').first

    photo_dest = "#{vars[:path]}#{vars[:file_prefix]}.jpg"
    puts photo_dest
    open("#{photo_dest}", 'wb') do |file|
      puts vars[:photo_url]
        file << open(vars[:photo_url]).read
    end

    sig_url = vars[:c].sig.url.to_s
    if sig_url.length > 1
      sig_dest = "#{vars[:path]}#{vars[:file_prefix]}_sig.jpg"
      open("#{sig_dest}", 'wb') do |file|
        file << open(vars[:sig_url]).read
      end
    end
  end

  def self.development_swag vars
    vars[:photo_url] = "#{vars[:base_path]}#{vars[:c].photo.url}".split('?').first
    if !File.directory? vars[:photo_url]
      photo_dest = "#{vars[:path]}#{vars[:file_prefix]}.jpg"
      FileUtils.cp vars[:photo_url], photo_dest

      sig_url = "#{vars[:base_path]}#{vars[:c].sig.url}".split('?').first
      if !File.directory? sig_url
        sig_dest = "#{vars[:path]}#{vars[:file_prefix]}_sig.jpg"
        puts sig_url
        puts sig_dest
        FileUtils.cp sig_url, sig_dest
      end
    end
  end
end

# Taken from https://github.com/rubyzip/rubyzip/blob/master/samples/example_recursive.rb
# This is a simple example which uses rubyzip to
# recursively generate a zip file from the contents of
# a specified directory. The directory itself is not
# included in the archive, rather just its contents.
#
# Usage:
#   directoryToZip = "/tmp/input"
#   outputFile = "/tmp/out.zip"
#   zf = ZipFileGenerator.new(directoryToZip, outputFile)
#   zf.write()
class ZipFileGenerator

  # Initialize with the directory to zip and the location of the output archive.
  def initialize(inputDir, outputFile)
    @inputDir = inputDir
    @outputFile = outputFile
  end

  # Zip the input directory.
  def write()
    entries = Dir.entries(@inputDir); entries.delete("."); entries.delete("..")
    io = Zip::File.open(@outputFile, Zip::File::CREATE);

    writeEntries(entries, "", io)
    io.close();
  end

  # A helper method to make the recursion work.
  private
  def writeEntries(entries, path, io)

    entries.each { |e|
      zipFilePath = path == "" ? e : File.join(path, e)
      diskFilePath = File.join(@inputDir, zipFilePath)
      puts "Deflating " + diskFilePath
      if  File.directory?(diskFilePath)
        io.mkdir(zipFilePath)
        subdir =Dir.entries(diskFilePath); subdir.delete("."); subdir.delete("..")
        writeEntries(subdir, zipFilePath, io)
      else
        io.get_output_stream(zipFilePath) { |f| f.puts(File.open(diskFilePath, "rb").read())}
      end
    }
  end

end
