defmodule PortalTest do
  use ExUnit.Case
  doctest Portal



  test "pushing from right to left"do
    Portal.shoot(:red)
    Portal.shoot(:blue)
    portal = Portal.transfer(:red, :blue, [1,2,3,4,5])
    Portal.push(portal, :red, :blue)
    Portal.push(portal, :red, :blue)
    Portal.push(portal, :blue, :red)
    assert Portal.Door.get(:blue) == [5]
  end

  test "pushing from left to right" do
    Portal.shoot(:orange)
    Portal.shoot(:black)
    portal = Portal.transfer(:orange, :black, [1,2,3,4,5])
    Portal.push(portal, :orange, :black)
    assert Portal.Door.get(:orange) == [4, 3, 2, 1]
  end
end
