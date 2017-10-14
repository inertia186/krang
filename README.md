krang
=====

[Krang](https://github.com/inertia186/krang) is a bot framework for STEEM.

<center>
  <img src="http://i.imgur.com/sQHfEQD.jpg" />
</center>

---

This framework will make it easier to write bots on the STEEM blockchain.

---

#### Install

To use this [Radiator](https://steemit.com/steem/@inertia/radiator-steem-ruby-api-client) framework:

I've tested it on various versions of ruby.  The oldest one I got it to work was:

`ruby 2.0.0p645 (2015-04-13 revision 50299) [x86_64-darwin14.4.0]`

In your `Gemfile`, add:

```ruby
gem 'krang'
```

In your app, create a class:

```ruby
require 'rubygems'
require 'bundler/setup'

Bundler.require

module MyBot
  include Krang
  
  extend self
  
  app_key :my_bot
end

puts MyBot.find_comment('inertia', 'macintosh-napintosh')
```

##### Configure

Edit the `config.yml` file.

```yaml
:my_bot:
  :block_mode: irreversible

:chain_options:
  :chain: steem
  :url: https://steemd.steemit.com
```

---

## Projects Using Krang ...

* Freakazoid
* Catfacts
* Dr. Otto

## Tests

* Clone the client repository into a directory of your choice:
  * `git clone https://github.com/inertia186/krang.git`
* Navigate into the new folder
  * `cd krang`
* Basic tests can be invoked as follows:
  * `rake`
* To run tests with parallelization and local code coverage:
  * `HELL_ENABLED=true rake`

## Get in touch!

If you're using Krang, I'd love to hear from you.  Drop me a line and tell me what you think!  I'm @inertia on STEEM and Discord.
  
## License

I don't believe in intellectual "property".  If you do, consider Krang as licensed under a Creative Commons [![CC0](http://i.creativecommons.org/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/) License.
