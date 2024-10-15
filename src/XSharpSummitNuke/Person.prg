begin namespace XSharpSummitNuke
   
   class Person

         property Name as string auto
         property Age as int auto
         property Job as string auto

         method Birthday() as void => self.Age++

         method NewJob(jobName as string) as void => self.Job := jobName

         method Resign() as void => self.Job := "Unemployed"

   end class

end namespace