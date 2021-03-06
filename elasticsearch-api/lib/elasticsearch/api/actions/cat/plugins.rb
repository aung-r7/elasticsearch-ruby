module Elasticsearch
  module API
    module Cat
      module Actions

        # Return information about installed plugins
        #
        # @option arguments [Boolean] :local Return local information, do not retrieve the state from master node
        #                                    (default: false)
        # @option arguments [Time] :master_timeout Explicit operation timeout for connection to master node
        # @option arguments [List] :h Comma-separated list of column names to display
        # @option arguments [List] :s Comma-separated list of column names or column aliases to sort by
        # @option arguments [Boolean] :help Return help information
        # @option arguments [Boolean] :v Verbose mode. Display column headers
        #
        # @see http://www.elastic.co/guide/en/elasticsearch/reference/master/cat-plugins.html
        #
        def plugins(arguments={})
          method = 'GET'
          path   = "_cat/plugins"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)
          body   = nil

          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.1.1
        ParamsRegistry.register(:plugins, [
            :local,
            :master_timeout,
            :h,
            :help,
            :v,
            :s ].freeze)
      end
    end
  end
end
