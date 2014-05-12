require 'middleman-core'

::Middleman::Extensions.register(:title) do
	require 'middleman-title/extension'
	::Middleman::Title
end