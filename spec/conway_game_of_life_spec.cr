require "./spec_helper"

describe ConwayGameOfLife do
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    context 'cell with no live neighbours' do
      it 'should be dead' do
        expect(cell).to be_dead
      end
    end
  end
end
