# vim-troff

This is a syntax plugin for troff files. At the moment it is focused on groff but will eventually support heirloom, neatroff, and DWB.

## Getting Started

### Prerequisites

None at the moment

### Installing

Install this plugin with your favorite plugin manager

vim-plugged

``` viml
Plug 'Gavinok/vim-troff'
```

## Usage

The following extensions will automatically be set to troff

- *.ms
- *.mom
- *.me
- *.mm
- *.tr
- *.troff

If you are using an unsupported extension ether set the file type manually using
`setfiletype troff` add an autocommand to your vimrc like this:

```
autocmd! BufRead,BufNewFile *.yourextension setlocal filetype=troff
```

## Contributing

Please read [CONTRIBUTING.md](https://github.com/your/project/contributing.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Gavin Jaeger-Freeborn** - *Initial work* - [Gavinok](https://github.com/Gavinok)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

None at the moment
