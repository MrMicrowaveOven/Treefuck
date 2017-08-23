require_relative '../lib/treefuck.rb'

describe "Treefuck" do
  it "can output the default value" do
    expect { Treefuck.new(".") }.to output('0').to_stdout
  end
  it "can take input" do
    Treefuck.any_instance.stub(gets: "8")
    expect { Treefuck.new(",.") }.to output('8').to_stdout
  end
end
