// eslint-disable-next-line @typescript-eslint/no-var-requires
const DumpBuildTimestampPlugin = require('./scripts/plugins/DumpBuildTimestampPlugin');
const {defineConfig} = require('@vue/cli-service');

module.exports = defineConfig({
  css: {
    loaderOptions: {
      sass: {
        additionalData: `@import "@/styles";`,
      },
    },
    extract: true,
  },
  transpileDependencies: ['@ohrm/oxd'],
  configureWebpack: {
    plugins: [new DumpBuildTimestampPlugin()],
    optimization: {
      splitChunks: {
        chunks: 'all',
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'chunk-vendors',
            chunks: 'all',
            priority: 10,
          },
          oxd: {
            test: /[\\/]node_modules[\\/]@ohrm[\\/]oxd[\\/]/,
            name: 'chunk-oxd',
            chunks: 'all',
            priority: 20,
          },
        },
      },
    },
    resolve: {
      fallback: {
        fs: false,
        path: false,
      },
      alias: {
        '@': require('path').resolve(__dirname, 'src'),
      },
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          include: /node_modules\/@ohrm\/oxd/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env'],
            },
          },
        },
      ],
    },
  },
  chainWebpack: (config) => {
    config.plugins.delete('html');
    config.plugins.delete('preload');
    config.plugins.delete('prefetch');
    config.plugins.delete('fork-ts-checker');

    // Ensure proper module resolution
    config.resolve.extensions
      .clear()
      .add('.js')
      .add('.ts')
      .add('.vue')
      .add('.json');

    // Set the correct chunk naming
    config.output.filename('js/[name].js').chunkFilename('js/[name].js');
    
    // Add source maps for debugging
    config.devtool('source-map');
  },
  publicPath: '.',
  filenameHashing: false,
  runtimeCompiler: true,
});
