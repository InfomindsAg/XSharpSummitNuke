using FluentAssertions
using VerifyXUnit
using System.Threading.Tasks
using XSharpSummitNuke
using XUnit

begin namespace XSharpSummitNuke.PersonTests


   public class VerifyTests

      private property MaxM as Person auto := Person{}{Name := "Max Mustermann", Age := 42, Job := "Developer"}

      [Fact];
      public method CheckInstance() as void
         Verifier.Verify(self.MaxM).ToTask().Wait()
         return


      [Fact];
      public method CheckCheangeAge() as void
         self.MaxM.Birthday()
         Verifier.Verify(self.MaxM).ToTask().Wait()
         return


//       [Fact];
//       public method CheckCheangeAgeRandom() as void
//          self.MaxM.Age := System.Random{}.Next(0, 100)
//          Verifier.Verify(self.MaxM).ToTask().Wait()
//          return


      [Fact];
      public method CheckResignJob() as void
         self.MaxM.Resign()
         Verifier.Verify(self.MaxM).ToTask().Wait()
         return


      [Fact];
      public method CheckNewJob() as void
         self.MaxM.NewJob("AI Assistant")
         Verifier.Verify(self.MaxM).ToTask().Wait()
         return

   end class


end namespace