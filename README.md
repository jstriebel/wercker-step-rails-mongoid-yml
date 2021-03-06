# Rails mongoid.yml

This [wercker step](http://devcenter.wercker.com/docs/steps) generates a `config/mongoid.yml` for [mongoid](http://mongoid.org).

[![wercker status](https://app.wercker.com/status/0f970597f3b22cab6008a3ab598114e3/s/master "wercker status")](https://app.wercker.com/project/bykey/0f970597f3b22cab6008a3ab598114e3)

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

- `db_name`
  (optinal, default: `mongoid`)
  This option is not required. If set, it will name the database accordingly.

## Details

You should use this along with the mongo service.
Have a look at the [services documentation](http://devcenter.wercker.com/docs/services) for more information.

## License

MIT License (MIT)
