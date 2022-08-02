Pod::Spec.new do |s|
  s.name             = 'libwebp'
  s.version          = '1.2.3'
  s.summary          = 'Library to encode and decode images in WebP format.'
  s.homepage         = 'https://developers.google.com/speed/webp/'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'BSD', :file => 'COPYING' }
  s.source           = { :git => 'https://github.com/webmproject/libwebp.git', :tag => 'v' + s.version.to_s }

  s.compiler_flags = '-D_THREAD_SAFE'
  s.requires_arc = false

  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/'
  }
  s.preserve_paths = 'src', 'sharpyuv'
  s.default_subspecs = 'webp', 'demux', 'mux'

  # webp decoding && encoding
  s.subspec 'webp' do |ss|
    ss.source_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/dec/*.{h,c}', 'src/enc/*.{h,c}', 'sharpyuv/*.{h,c}'
    ss.public_header_files = 'src/webp/decode.h', 'src/webp/encode.h', 'src/webp/types.h', 'src/webp/mux_types.h', 'src/webp/format_constants.h'
  end

  # animated webp decoding
  s.subspec 'demux' do |ss|
    ss.dependency 'libwebp/webp'
    ss.source_files = 'src/demux/*.{h,c}', 'src/webp/demux.h'
    ss.public_header_files = 'src/webp/demux.h'
  end

  # animated webp encoding
  s.subspec 'mux' do |ss|
    ss.dependency 'libwebp/demux'
    ss.source_files = 'src/mux/*.{h,c}', 'src/webp/mux.h'
    ss.public_header_files = 'src/webp/mux.h'
  end

  # fix #include <inttypes.h> cause 'Include of non-modular header inside framework module error'
  s.prepare_command = <<-CMD
                      sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'
                      CMD
end
