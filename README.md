JRL website
===========

## Testing locally

In order to test your modifications locally before pushing to GitHub, install
`jekyll`, and run the following command at the root of the project folder:

```sh
$ jekyll server --safe --trace
```

You will get something like:

```
Configuration file: /path/to/jrl-umi3218.github.com/_config.yml
           Source:  /path/to/jrl-umi3218.github.com
       Destination: /path/to/jrl-umi3218.github.com/_site
      Generating... 
                    done.
Configuration file: /path/to/jrl-umi3218.github.com/_config.yml
    Server address: http://0.0.0.0:4000/
  Server running... press ctrl-c to stop
```

Then simply type the server address in your browser (`http://0.0.0.0:4000/`
here).

## Jekyll theme

We use the [startbootstrap-modern-business](https://github.com/BlackrockDigital/startbootstrap-modern-business).
