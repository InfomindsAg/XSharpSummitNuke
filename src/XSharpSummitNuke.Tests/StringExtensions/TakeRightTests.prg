using XUnit
using FluentAssertions

begin namespace XSharpSummitNuke.StringExtensionTests

   class TakeRightTests

      [Theory];
      [InlineData(0)];
      [InlineData(10)];
      public method NullString_ReturnsNull(length as int) as void
         local input := null as string
         input.TakeRight(length).Should().BeNull()
         return


      [Theory];
      [InlineData(0, "")];
      [InlineData(10, "")];
      public method EmptyString_ReturnsEmptyString(length as int, expected as string) as void
         var input := ""
         input.TakeRight(length).Should().Be(expected)
         return


      [Theory];
      [InlineData(1, "!")];
      [InlineData(5, "orld!")];
      [InlineData(10, "lo, World!")];
      [InlineData(13, "Hello, World!")];
      public method LengthSmallerThanInput_ReturnsRightmostPartOfInputString(length as int, expected as string) as void
         var input := "Hello, World!"
         input.TakeRight(length).Should().Be(expected)
         return


      [Fact];
      public method LengthGreaterThanInput_ReturnsInputString() as void
         var input := "Hello, World!"
         input.TakeRight(input.Length+5).Should().Be(input)
         return


      [Fact];
      public method CompareWithFuntionRight() as void
         var input := "Hello, World!"
         for var i := 0 upto input.Length+5
            input.TakeRight(i).Should().Be(Right(input, (dword)i))
         next
         return


      [Fact];
      public method WithNegativeLength_ThrowsException() as void
         var input := "Hello, World!"
         var act := System.Action{{ => input.TakeRight(-5)}}
         act.Should().Throw<ArgumentOutOfRangeException>()
         return


   end class

end namespace