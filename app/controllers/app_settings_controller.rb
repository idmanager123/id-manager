class AppSettingsController < ApplicationController
  def edit
    @app_setting = AppSettings.instance
  end
  def update
    @app_setting = AppSettings.instance
    if @app_setting.update app_settings_params
      render :edit, notice: 'Editted successfully'
    else
      render :edit
    end
  end
  private
  def app_settings_params
    params.require(:app_settings).permit(:default_head_hunting_fee, :default_id_cost, :default_id_price)
  end
end
