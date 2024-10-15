using XUnit
using FluentAssertions

begin namespace XSharpSummitNuke.StringExtensionTests

   public class ShortenTests


      [Fact];
      public method Shorten_WithNullString_ReturnsNull() as void
         local input := null as string
         var result := input.Shorten(5)
         result.Should().BeNull()
         return


      [Fact];
      public method Shorten_WithEmptyString_ReturnsEmptyString() as void
         var input := ""
         var result := input.Shorten(5)
         result.Should().Be("")
         return


      [Fact];
      public method Shorten_WithZeroMaxLength_ReturnsEmptyString() as void
         var input := "This is a string"
         var result := input.Shorten(0)
         result.Should().Be("")
         return


      [Fact];
      public method Shorten_WithMaxLengthLessThan3_ReturnsShortenedStringWithoutSuffix() as void
         var input := "This is a long string"
         var result := input.Shorten(2)
         result.Should().Be("Th")
         return


      [Fact];
      public method Shorten_WithNegativeLength_ThrowsException() as void
         var input := "This is a long string"
         var act := System.Action{{ => input.Shorten(-5)}}
         act.Should().Throw<ArgumentException>()
         return


      [Fact];
      public method Shorten_WithMaxLengthGreaterThanStringLength_ReturnsOriginalString() as void
         var input := "Short string"
         var result := input.Shorten(50)
         result.Should().Be(input)
         return


      [Fact];
      public method Shorten_WithMaxLengthLessThanStringLength_ReturnsShortenedString() as void
         var input := "This is a long string"
         var result := input.Shorten(15)
         result.Should().Be("This is a lo...")
         return


      [Fact];
      public method Shorten_WithLength100_ReturnsShortenedString() as void
         var input := "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
         var result := input.Shorten(100)
         result.Should().Be("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...")
         return

   end class

end namespace
