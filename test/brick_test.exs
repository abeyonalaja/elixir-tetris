defmodule BrickTest do
  use ExUnit.Case
  import Tetris.Brick

  test "Creates a new brick" do
    assert new_brick().name == :i
  end

  test "Creates a new random brick" do
    actual = new_random()

    assert actual.name in [:i, :l, :z, :t, :o]
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "should manipulate brick" do
    actual = new_brick()
    |> left
    |> right
             |> right
    |> down
    |> spin_90
    |> spin_90

    assert actual.location == {41, 1}
    assert actual.rotation == 180
  end

  test "should return points for i shape" do
    points =
    new_brick(name: :i)|>points()
    assert {2,2} in points
  end

  def new_brick(attributes \\ []), do: new(attributes)

end
