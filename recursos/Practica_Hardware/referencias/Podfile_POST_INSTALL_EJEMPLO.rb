# Adaptar el BLOQUE EXISTENTE post_install en ios/Podfile,
# no agregar un segundo bloque post_install.
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    if target.name == 'geolocator_apple'
      target.build_configurations.each do |config|
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)']
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] << 'BYPASS_PERMISSION_LOCATION_ALWAYS=1'
      end
    end
  end
end
