defmodule Tetris.Points do
  def translate(points, {x, y}) do
    Enum.map(points, fn {px, py} -> {px + x, py + y} end)
  end
end