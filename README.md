# Combine Errors

Sometimes you want to use SimpleForm and have 2 or 3 inputs on the same line.  Like with an address.

    = simple_form_for @profile do |f|
      .form-inputs
        = f.input :name
        = f.input :address_line_1
        = f.input :address_line_2
        = f.input :city_state_zip do
          = f.input_field :city, class: 'input-medium'
          = f.input_field :state, collection: State.all
          = f.input_field :zip, class: 'input-small'


But it would be nice if the errors still stacked up nicely.  That's where Combined Errors comes in:

    class Profile < ActiveRecord::Base
      # ...
      validates :city, presence: true
      validates :state, presence: true
      validates :zip, presence: true

      combine_errors :city_state_zip, [:city, :state, :zip]
    end

## Installation

Add this line to your application's Gemfile:

    gem 'combine_errors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install combine_errors

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
