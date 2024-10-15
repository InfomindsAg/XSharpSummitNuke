using XUnit
using FluentAssertions

begin namespace XSharpSummitNuke.StringExtensionTests

   class TakeLeftTests

      [Theory];
      [InlineData(0)];
      [InlineData(10)];
      public method NullString_ReturnsNull(length as int) as void
         local input := null as string
         input.TakeLeft(length).Should().BeNull()
         return


      [Theory];
      [InlineData(0, "")];
      [InlineData(10, "")];
      public method EmptyString_ReturnsEmptyString(length as int, expected as string) as void
         var input := ""
         input.TakeLeft(length).Should().Be(expected)
         return


      [Theory];
      [InlineData(1, "H")];
      [InlineData(5, "Hello")];
      [InlineData(10, "Hello, Wor")];
      [InlineData(13, "Hello, World!")];
      public method LengthSmallerThanInput_ReturnsLeftmostPartOfInputString(length as int, expected as string) as void
         var input := "Hello, World!"
         input.TakeLeft(length).Should().Be(expected)
         return


      [Fact];
      public method LengthGreaterThanInput_ReturnsInputString() as void
         var input := "Hello, World!"
         input.TakeLeft(input.Length+5).Should().Be(input)
         return


      [Fact];
      public method CompareWithFuntionLeft() as void
         var input := "Hello, World!"
         for var i := 0 upto input.Length+5
            input.TakeLeft(i).Should().Be(Left(input, (dword)i))
         next
         return


      [Fact];
      public method NegativeLength_ThrowsException() as void
         var input := "Hello, World!"
         var act := System.Action{{ => input.TakeLeft(-5)}}
         act.Should().Throw<ArgumentOutOfRangeException>()
         return


   end class

end namespace