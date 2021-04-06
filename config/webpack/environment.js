// config/webpack/environment.js
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        Popper: ['popper.js', 'default'],
    })
)

environment.loaders.append('jquery', {
    test: require.resolve('jquery'),
    loader: 'expose-loader',
    options: {
        exposes: ['$', 'jQuery']
    }
})


module.exports = environment