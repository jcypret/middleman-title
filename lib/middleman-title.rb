require 'middleman-core'

::Middleman::Extensions.register(:title, Title) do
	require 'middleman-title/extension'
	::Middleman::Title
end