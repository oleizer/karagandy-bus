using_bundler = defined? Bundler


platform :ios, '10.0'

def ui_pods
    pod 'SnapKit'
end

def main_app_pods
  ui_pods
end

def test_pods
  pod 'Nimble'
  pod 'Quick'
end

target 'KaragandyBus' do
  use_frameworks!
  main_app_pods
    pod 'PromiseKit'
    pod 'Moya'
  target 'KaragandyBusTests' do
    inherit! :search_paths
    test_pods
  end

  target 'KaragandyBusUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
