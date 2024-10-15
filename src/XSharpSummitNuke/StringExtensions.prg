/// <summary>Extensions for the DataType String.</summary>
public static class StringExtensions

   private static _TrimCharArray := <char>{c'\n', c'\r', c' '} as char[]

   /// <summary>Shorten the string to a maximum length and add "..." at the end if the string is longer than the maximum length.</summary>
   /// <param name="maxLength">The maximum length of the string.</param>
   /// <returns>The shortened string.</returns>
   public static method Shorten(self s as string, maxLength as int) as string
      if maxLength < 0
         throw ArgumentOutOfRangeException{nameof(maxLength), "The maximum length must be greater than or equal to 0."}
      elseif maxLength == 0
         return String.Empty
      endif
      if s == null || s.Length <= maxLength
         return s
      endif
      var suffix := (string)iif(maxLength < 3, String.Empty, "...")
      var res := s.Substring(0, maxLength - suffix.Length).TrimEnd(_TrimCharArray)
      return i"{res}{suffix}"


   /// <summary> Get the left part of the string with a maximum length.</summary>
   /// <remarks> If the string is shorter than the maximum length, the whole string is returned.</remarks>
   /// <param name="length">The maximum length of the string.</param>
   /// <returns>The left part of the string.</returns>
   public static method TakeLeft(self txt as string, length as int) as string
      if length < 0
         throw ArgumentOutOfRangeException{nameof(length), "The length must be greater than or equal to 0."}
      elseif string.IsNullOrEmpty(txt)
         return txt
      elseif length == 0
         return String.Empty
      elseif txt.Length <= length
         return txt
      endif
      return txt.Substring(0, length)

   /// <summary> Get the right part of the string with a maximum length.</summary>
   /// <remarks> If the string is shorter than the maximum length, the whole string is returned.</remarks>
   /// <param name="length">The maximum length of the string.</param>
   /// <returns>The right part of the string.</returns>
   public static method TakeRight(self txt as string, length as int) as string
      if length < 0
         throw ArgumentOutOfRangeException{nameof(length), "The length must be greater than or equal to 0."}
      elseif string.IsNullOrEmpty(txt)
         return txt
      elseif length == 0
         return String.Empty
      elseif txt.Length <= length
         return txt
      endif
      return txt.Substring(txt.Length - length)


end class