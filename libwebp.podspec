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
  s.default_subspecs = 'dec', 'enc', 'demux', 'mux'

  # common code, used by actual subspecs
  s.subspec 'core' do |ss|
    ss.source_files = 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/webp/types.h', 'src/webp/format_constants.h'
    ss.public_header_files = 'src/webp/types.h', 'src/webp/format_constants.h'
  end

  # webp decoding
  s.subspec 'dec' do |ss|
    ss.dependency 'libwebp/core'
    ss.source_files = 'src/dec/*.{h,c}', 'src/webp/decode.h'
    ss.public_header_files = 'src/webp/decode.h'
  end

  # webp encoding
  s.subspec 'enc' do |ss|
    ss.dependency 'libwebp/core'
    ss.source_files = 'src/enc/*.{h,c}', 'src/webp/encode.h'
    ss.public_header_files = 'src/webp/encode.h'
  end

  # animated webp decoding
  s.subspec 'demux' do |ss|
    ss.dependency 'libwebp/dec'
    ss.source_files = 'src/demux/*.{h,c}', 'src/webp/demux.h', 'src/webp/mux_types.h'
    ss.public_header_files = 'src/webp/demux.h', 'src/webp/mux_types.h'
  end

  # animated webp encoding
  s.subspec 'mux' do |ss|
    ss.dependency 'libwebp/enc'
    ss.dependency 'libwebp/demux'
    ss.source_files = 'src/mux/*.{h,c}', 'src/webp/mux.h'
    ss.public_header_files = 'src/webp/mux.h'
  end

  # fix #include <inttypes.h> cause 'Include of non-modular header inside framework module error'
  s.prepare_command = <<-CMD
                      sed -i.bak 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'
                      CMD
end
