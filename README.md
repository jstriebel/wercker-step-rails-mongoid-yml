# Rails mongoid.yml

This [wercker step](http://devcenter.wercker.com/docs/steps) generates a `config/mongoid.yml` for [mongoid](http://mongoid.org).

## Example

```yml
box: ruby
services:
  - mongo
build:
  steps:
    - rails-mongoid-yml:
        db_name: my_app_test
```

## Options

- `db_name` (optinal, default: `mongoid`)
  This option is not required. If set, it will set the database accordingly.

## Details

You should use this along with the mongo service.
Have a look at the [services documentation](http://devcenter.wercker.com/docs/services) for more information.

## License

MIT License (MIT)
