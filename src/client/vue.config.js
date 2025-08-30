// eslint-disable-next-line @typescript-eslint/no-var-requires
const DumpBuildTimestampPlugin = require('./scripts/plugins/DumpBuildTimestampPlugin');
const webpack = require('webpack');

module.exports = {
  css: {
    loaderOptions: {
      sass: {
        additionalData: `@import "@/core/styles";`,
      },
    },
    extract: true,
  },
  transpileDependencies: ['@ohrm/oxd'],
  configureWebpack: {
    resolve: {
      alias: {
        '@ohrm/core': '@/core',
        '@ohrm/components': '@/core/components',
      },
    },
    plugins: [
      new DumpBuildTimestampPlugin(),
      new webpack.DefinePlugin({
        __VUE_PROD_HYDRATION_MISMATCH_DETAILS__: 'false',
        __VUE_PROD_DEVTOOLS__: 'false',
        __VUE_OPTIONS_API__: 'true',
        __VUE_PROD_TIPS__: 'false',
      }),
    ],
    optimization: {
      splitChunks: {
        chunks: 'all',
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'chunk-vendors',
            chunks: 'all',
          },
        },
      },
    },
  },
  chainWebpack: (config) => {
    config.plugins.delete('html');
    config.plugins.delete('preload');
    config.plugins.delete('prefetch');

    // Ensure proper module resolution
    config.resolve.extensions
      .clear()
      .add('.js')
      .add('.ts')
      .add('.vue')
      .add('.json');

    // Set the correct chunk naming
    config.output.filename('js/[name].js').chunkFilename('js/[name].js');
  },
  publicPath: '.',
  filenameHashing: false,
  runtimeCompiler: true,
};
