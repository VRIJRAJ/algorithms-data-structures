require 'rspec'
require_relative 'trie'

describe Trie do
  subject(:trie) { Trie.new }

  it 'returns the correct amount of completions' do
    trie.add_word("hack")
    trie.add_word("hackerrank")
    trie.add_word("hacky")

    expect(trie.count_completions_for_partial("hac")).to eq 3
    expect(trie.count_completions_for_partial("hak")).to eq 0
  end
end
