require_relative '../lib/treefuck.rb'

describe "Treefuck" do
  it "can output the default value with `.`" do
    expect { Treefuck.new(".") }.to output('0').to_stdout
  end
  it "can output several times with `..`" do
    expect { Treefuck.new("..") }.to output('00').to_stdout
  end
  it "can take input with `,`" do
    allow_any_instance_of(Treefuck).to receive(:gets).and_return("8")
    expect { Treefuck.new(",.") }.to output('8').to_stdout
  end
  it "can increment the current node with `+`" do
    expect { Treefuck.new("+.") }.to output('1').to_stdout
  end
  it "can decrement the current node with `-`" do
    expect { Treefuck.new("-.") }.to output('-1').to_stdout
  end
  it "can output before and after incrementing" do
    expect { Treefuck.new(".+.") }.to output('01').to_stdout
  end
  it "can increment an input" do
    allow_any_instance_of(Treefuck).to receive(:gets).and_return("8")
    expect { Treefuck.new(",+.") }.to output('9').to_stdout
  end
  it "can iterate inside the `[]` blocks" do
    allow_any_instance_of(Treefuck).to receive(:gets).and_return("3")
    expect { Treefuck.new(",[.-]") }.to output('321').to_stdout
  end
  it "can make left children and increment them seperately" do
    expect { Treefuck.new("<++.") }.to output('2').to_stdout
    expect { Treefuck.new("<++|.") }.to output('0').to_stdout
  end
  it "can make right children and increment them seperately" do
    expect { Treefuck.new(">++.") }.to output('2').to_stdout
    expect { Treefuck.new(">++|.") }.to output('0').to_stdout
  end
  it "remembers parent and children" do
    expect { Treefuck.new("+<++|<.") }.to output('2').to_stdout
    expect { Treefuck.new("+<++|<|.") }.to output('1').to_stdout
  end
  it "can iterate through parent and child" do
    allow_any_instance_of(Treefuck).to receive(:gets).and_return("3")
    expect { Treefuck.new(",[>+.|-],[<+.|-]")}.to output('123123').to_stdout
  end
  it "outputs a sum of children" do
    allow_any_instance_of(Treefuck).to receive(:gets).and_return("4")
    expect { Treefuck.new("<,|>,|<[-|+<]|>[-|+>]|.") }.to output("8").to_stdout
  end
  it "can't work its way up uninitialized ancestors" do
    expect { Treefuck.new("|||+|>.") }.to raise_error(StandardError)
    expect { Treefuck.new("|||+|<.") }.to raise_error(StandardError)
    expect { Treefuck.new("|") }.to raise_error(StandardError)
  end

  # Not quite sure what this example is supposed to do.
  # It's too long to work out manually, and for some reason
  # it's causing an infinite loop in my version.
  # Meh, I'll try again later.

  # it "can print 'Hello World!'" do
  #   hello_world_string = "++++++++[>++++[>++>+++>+++>+||||-]>+>+>->>+[|]|-]>>.>---.+++++++..+++.>>.|-.|.+++.------.--------.>>+.>++."
  #   expect { Treefuck.new(hello_world_string) }.to output("?").to_stdout
  # end
end
