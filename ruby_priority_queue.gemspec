# frozen_string_literal: true

require_relative "lib/ruby_priority_queue/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_priority_queue"
  spec.version = RubyPriorityQueue::VERSION
  spec.authors = ["Cao Van Bi"]
  spec.email = ["caovanbi235@gmail.com"]

  spec.summary = "A priority queue implementation in Ruby"
  spec.description = "A priority queue implementation in Ruby"
  spec.homepage = "https://github.com/caovanbi235/ruby_priority_queue"
  spec.license = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
