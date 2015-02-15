ID Manager
=========

ID Manager is an easy way to track your ID orders and customer information

Requirements
-----------

* Ruby version **>=2.0.0**
* [ImageMagick](http://www.imagemagick.org)
  * This can be installed on Mac OS X using `brew install imagemagick`
* SQLite 3
* For production
  * Postrgesql
  * Amazon S3

Running locally
-------

First start off by making sure you have everything installed aboved. After that, run:
```
bundle install
bundle
./setup_db.sh
```

After that, run
```
rails server
```

Running on AWS
--------------
You must have the elastic beanstalk CLI installed

Change `config/environments/paperclip_options.yml` to set up your aws credential.

Change `config/database.yml` to set up your postgresql credentials

To see the deployment process, check out [the AWS guide](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_rails.html)



If you find this project helpful and would like to donate, my btc address is `1A2SkMUqKnE5K7TX1ZAUxugzkq6SxB2JY7`
