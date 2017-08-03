Pod::Spec.new do |spec|
spec.name = "ESUtilities"
spec.version = "1.0.0"
spec.summary = "Utility framework for common methods that i usually use in a lot of my projects, it is still not completed yet , but you can use like this for now."
spec.homepage = "https://github.com/EslamHanafy/ESUtilities"
spec.license = { type: 'GNU', file: 'LICENSE' }
spec.authors = { "Eslam Hanafy" => 'work.eslam.hanafy@gmail.com' }
spec.social_media_url = "https://www.facebook.com/eslameslam.nour"

spec.platform = :ios, "9.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/EslamHanafy/ESUtilities.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "ESUtilities/**/*.{h,swift}"


end
