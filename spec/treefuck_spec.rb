require_relative '../lib/treefuck.rb'

describe "Treefuck" do
  it "can output the default value" do
    expect { Treefuck.new(".") }.to output('0').to_stdout
  end
  # it "can output a child's value" do
  #   expect { Treefuck.new(".") }.to output('0').to_stdout
  # end
end
