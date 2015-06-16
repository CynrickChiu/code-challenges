require_relative 'tree_traverse'

describe "depth first search and breadth first search" do
  before do
    # The "Leafs" of a tree, elements that have no children
    @fifth_node = Tree.new(5, [])
    @eleventh_node = Tree.new(11, [])
    @fourth_node = Tree.new(4, [])

    # The "Branches" of the tree
    @ninth_node = Tree.new(9, [@fourth_node])
    @sixth_node = Tree.new(6, [@fifth_node, @eleventh_node])
    @seventh_node = Tree.new(7, [@sixth_node])
    @fifth_node = Tree.new(5, [@ninth_node])

    # The "Trunk" of the tree
    @trunk = Tree.new(2, [@seventh_node, @fifth_node])
  end

  describe "dfs_recursive" do
    context "when no nodes match the search_value" do
      let(:result) { dfs_recursive(@trunk, 3) }
      it "returns nil" do
        expect(result).to eq(nil)
      end
    end

    context "when a node matches the search_value" do
      let(:result) { dfs_recursive(@trunk, 11) }
      it "returns the node matching the search_value" do
        expect(result).to eq(@eleventh_node)
      end
    end
  end

  describe "dfs_iterative" do
    context "when no nodes match the search_value" do
      let(:result) { dfs_iterative(@trunk, 15) }
      it "returns nil" do
        expect(result).to eq(nil)
      end
    end

    context "when a node matches the search_value" do
      let(:result) { dfs_iterative(@trunk, 4) }
      it "returns the node matching the search_value" do
        expect(result).to eq(@fourth_node)
      end
    end
  end

  describe "bfs" do
    context "when no nodes match the search_value" do
      let(:result) { bfs(@trunk, 13) }
      it "returns nil" do
        expect(result).to eq(nil)
      end
    end

    context "when a node matches the search_value" do
      let(:result) { bfs(@trunk, 9)}
      it "returns the node matching the search_value" do
        expect(result).to eq(@ninth_node)
      end
    end
  end
end