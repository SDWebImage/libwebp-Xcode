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
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/**'
  }

  s.subspec 'webp' do |ss|
    ss.header_dir = 'webp'
    ss.source_files = 'src/webp/*.h'
  end

  s.subspec 'core' do |ss|
    ss.source_files = [
      'src/utils/*.{h,c}',
      'src/dsp/*.{h,c}',
      'src/enc/*.{h,c}',
      'src/dec/*.{h,c}'
    ]
    ss.dependency 'libwebp/webp'
  end

  s.subspec 'utils' do |ss|
    ss.dependency 'libwebp/core'
  end

  s.subspec 'dsp' do |ss|
    ss.dependency 'libwebp/core'
  end

  s.subspec 'enc' do |ss|
    ss.dependency 'libwebp/core'
  end

  s.subspec 'dec' do |ss|
    ss.dependency 'libwebp/core'
  end

  s.subspec 'demux' do |ss|
    ss.source_files = 'src/demux/*.{h,c}'
    ss.dependency 'libwebp/core'
  end

  s.subspec 'mux' do |ss|
    ss.source_files = 'src/mux/*.{h,c}'
    ss.dependency 'libwebp/core'
  end
end
