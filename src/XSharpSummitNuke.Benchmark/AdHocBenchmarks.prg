using System
using System.Collections.Generic
using System.Linq
using System.Text
using BenchmarkDotNet.Attributes

/// <summary>
/// This Benchmark class can be used for quick benchmarks, that will not be commited.
/// </summary>
[InProcessAttribute];
class AdHocBenchmarks

   private method DoNothing(s as string) as string
      return s


   [Benchmark];
   method Test1() as void
      for var i := 1 upto 1000
         var s := "This is my start-string where i want to print some Numbers"+System.Environment.NewLine
         s += "My Number is: "+i.ToString()
         if i%2 == 0
            s += "( Hey it is a even Number ) "
         endif
         s := self.DoNothing(s)
      next
      return

#Region Test2
//    [Benchmark];
//    method Test2() as void
//       for var i := 1 upto 1000
//          if i%2 == 0
//             var s := "This is my start-string where i want to print some Numbers" +System.Environment.NewLine+ "My Number is: "+i.ToString()+"( Hey it is a even Number ) "
//             s := self.DoNothing(s)
//          else
//             var s := "This is my start-string where i want to print some Numbers" +System.Environment.NewLine+ "My Number is: "+i.ToString()
//             s := self.DoNothing(s)
//          endif
//       next
//       return
#EndRegion Test2

#Region Test3
//    [Benchmark];
//    method Test3() as void
//       for var i := 1 upto 1000
//          if i%2 == 0
//             var s := i"This is my start-string where i want to print some Numbers{System.Environment.NewLine}My Number is: {i.ToString()}( Hey it is a even Number ) "
//             s := self.DoNothing(s)
//          else
//             var s := i"This is my start-string where i want to print some Numbers{System.Environment.NewLine}My Number is: {i.ToString()}"
//             s := self.DoNothing(s)
//          endif
//       next
//       return
#EndRegion Test3

#Region Test4
//    [Benchmark];
//    method Test4() as void
//       var temp1 := "This is my start-string where i want to print some Numbers{0}My Number is: {1}{2}"
//       var temp2 := "This is my start-string where i want to print some Numbers{0}My Number is: {1}"
//       for var i := 1 upto 1000
//          if i%2 == 0
//             var s := String.Format(temp1, System.Environment.NewLine, i.ToString(), "( Hey it is a even Number ) ")
//             s := self.DoNothing(s)
//          else
//             var s := String.Format(temp2, System.Environment.NewLine, i.ToString())
//             s := self.DoNothing(s)
//          endif
//       next
//       return
#EndRegion Test4

#Region Test3-b
//    [Benchmark];
//    method Test3b() as void
//       for var i := 1 upto 1000
//          if i%2 == 0
//             var s := i"This is my start-string where i want to print some Numbers{System.Environment.NewLine}My Number is: {i}( Hey it is a even Number ) "
//             s := self.DoNothing(s)
//          else
//             var s := i"This is my start-string where i want to print some Numbers{System.Environment.NewLine}My Number is: {i}"
//             s := self.DoNothing(s)
//          endif
//       next
//       return
#EndRegion Test3-b

#Region Test4-b
//    [Benchmark];
//    method Test4b() as void
//       var temp1 := "This is my start-string where i want to print some Numbers{0}My Number is: {1}{2}"
//       var temp2 := "This is my start-string where i want to print some Numbers{0}My Number is: {1}"
//       for var i := 1 upto 1000
//          if i%2 == 0
//             var s := String.Format(temp1, System.Environment.NewLine, i, "( Hey it is a even Number ) ")
//             s := self.DoNothing(s)
//          else
//             var s := String.Format(temp2, System.Environment.NewLine, i)
//             s := self.DoNothing(s)
//          endif
//       next
//       return
#EndRegion Test4-b


end class