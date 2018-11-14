defmodule SExprCalc.CalcTest do
  use ExUnit.Case
  doctest SExprCalc.Calc
  alias SExprCalc.Calc

  describe "parse/1" do
    test "single number" do
      assert Calc.parse("1") == 1
      assert Calc.parse("100") == 100
    end

    test "simple addition s-expression" do
      program = "(add 1 1)"
      expected = [:+, 1, 1]
      result = Calc.parse(program)

      assert expected -- result == []
      assert result -- expected == []
    end

    test "simple multiplication s-expression" do
      program = "(multiply 2 3)"
      expected = [:*, 2, 3]
      result = Calc.parse(program)

      assert expected -- result == []
      assert result -- expected == []
    end

    test "complex addition and multiplication s-expression" do
      program = "(add (add 1 1) (multiply 2 2))"
      expected = [:+, :+, 1, 1, :*, 2, 2]
      result = Calc.parse(program)

      assert expected -- result == []
      assert result -- expected == []
    end
  end

  describe "evaluate/1" do
    test "simple addition" do
      program = [:+, 2, 2]
      expected = 4
      result = Calc.evaluate(program)

      assert expected == result
    end

    test "simple multiplication" do
      program = [:*, 2, 2]
      expected = 4
      result = Calc.evaluate(program)

      assert expected == result
    end

    test "complex addition and multiplication" do
      program = [:+, 1, :*, :+, 2, 2, :*, 4, 2]
      expected = 33
      result = Calc.evaluate(program)

      assert expected == result
    end
  end
end