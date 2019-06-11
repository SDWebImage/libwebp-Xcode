Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.0.2'
  s.summary          = 'Library to encode and decode images in WebP format.'
  s.homepage         = 'https://developers.google.com/speed/webp/'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.source           = { :git => 'https://chromium.googlesource.com/webm/libwebp', :tag => 'v' + s.version.to_s }

  s.compiler_flags = '-D_THREAD_SAFE'
  s.requires_arc = false

  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/'
  }
  s.preserve_path = 'src'

  s.source_files = 'src/webp/*.{h,c}', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/enc/*.{h,c}', 'src/dec/*.{h,c}', 'src/demux/*.{h,c}', 'src/mux/*.{h,c}'
  s.public_header_files = 'src/webp/*.h'

  # fix #include <inttypes.h> cause 'Include of non-modular header inside framework module error'
  s.prepare_command = <<-CMD
                      sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'
                      CMD
end
