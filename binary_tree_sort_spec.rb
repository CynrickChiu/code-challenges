require 'rspec'
require_relative 'binary_tree_sort'

describe BinaryTree do
  let(:first) { BinaryTree.new(1, nil, nil) }
  let(:sixth) { BinaryTree.new(6, nil, nil) }
  let(:fourth) { BinaryTree.new(4, first, sixth) }
  let(:tenth) { BinaryTree.new(10, nil, nil) }
  let(:fourteenth) { BinaryTree.new(14, tenth, nil) }
  let(:ninth) { BinaryTree.new(9, nil, fourteenth) }
  let(:tree) { BinaryTree.new(7, fourth, ninth) }

  subject { described_class.new }

  it "has no payload" do
    expect(subject.payload).to be_nil
  end

  it "has no child nodes" do
    expect(subject.left).to be_nil
    expect(subject.right).to be_nil
  end

  context "when providing a payload" do
    subject { described_class.new(5) }
  
    it "sets the payload" do
      expect(subject.payload).to eq(5)
    end
  end

  describe "#build_binary_tree" do
    subject { BinaryTree.new.build_binary_tree([7, 4, 9, 1, 6, 14, 10]) }

    it "builds a binary tree" do
      expect(subject).to eq(tree)
    end
  end

  describe "#binary_tree_sort" do
    subject { tree.binary_tree_sort }

    it "builds a sorted list from a binary tree" do
      expect(subject).to eq([1, 4, 6, 7, 9, 10, 14])
    end
  end
end
