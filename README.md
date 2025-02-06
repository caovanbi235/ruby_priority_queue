# RubyPriorityQueue

The `RubyPriorityQueue` gem provides a simple implementation of a priority queue in Ruby. A priority queue is a data structure where each element is associated with a priority, and elements are served based on their priority.


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ruby_priority_queue

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ruby_priority_queue

## Usage

Here's how you can use the `RubyPriorityQueue` gem:

```ruby
require 'ruby_priority_queue'

# Create a new priority queue
pq = RubyPriorityQueue::PriorityQueue.new

# Push elements with their priorities (lower value means higher priority, if you want to use a max heap, you can negate the priority)
pq.push('task1', 1)
# You can also use keyword arguments
pq.push(item: 'task2', priority: 2)

# Pop the element with the highest priority
item, priority = pq.pop
puts "Item: #{item}, Priority: #{priority}" # Output: Item: task1, Priority: 1

# Check if the priority queue is empty
puts pq.empty? # Output: false

# Peek the item with the highest priority
item, priority = pq.peek
puts "Item: #{item}, Priority: #{priority}" # Output: Item: task2, Priority: 2

# Get the size of the priority queue
puts pq.size # Output: 1
```

## Development

To contribute to the development of this gem, follow these steps:

1. Clone the repository:
```bash 
   $ git clone https://github.com/caovanbi235/ruby_priority_queue.git 
```

2. Install dependecies:
```bash
   $ bin/setup
```

3. Run tests:
```bash
   $ rake spec
```

4. Experiment with the code:
```bash
   $ bin/console
```

5. To install this gem onto your local machine, run:
```bash
   $ bundle exec rake install
```

6. To release a new version, update the version number in `version.rb`, and then run:
```bash
   $ bundle exec rake release
```
This will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/caovanbi235/ruby_priority_queue.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
