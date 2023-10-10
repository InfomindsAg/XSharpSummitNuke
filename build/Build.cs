using System;
using System.Linq;
using Nuke.Common;
using Nuke.Common.CI;
using Nuke.Common.Execution;
using Nuke.Common.IO;
using Nuke.Common.ProjectModel;
using Nuke.Common.Tooling;
using Nuke.Common.Tools.MSBuild;
using static Nuke.Common.Tools.MSBuild.MSBuildTasks;
using Nuke.Common.Tools.VSTest;
using Nuke.Common.Utilities.Collections;
using static Nuke.Common.EnvironmentInfo;
using static Nuke.Common.IO.FileSystemTasks;
using static Nuke.Common.IO.PathConstruction;

class Build : NukeBuild
{
    /// Support plugins are available for:
    ///   - JetBrains ReSharper        https://nuke.build/resharper
    ///   - JetBrains Rider            https://nuke.build/rider
    ///   - Microsoft VisualStudio     https://nuke.build/visualstudio
    ///   - Microsoft VSCode           https://nuke.build/vscode

    public static int Main() => Execute<Build>(x => x.Compile);

    private bool IsUnitTestProject(string name)
        => name.EndsWith(".Tests", StringComparison.CurrentCultureIgnoreCase) ||
           name.EndsWith(".UnitTests", StringComparison.CurrentCultureIgnoreCase);

    /// <summary>
    /// Defines the directory that contains the projects
    /// </summary>
    protected virtual AbsolutePath SourceDirectory => RootDirectory / "src";

    /// <summary>
    /// Defines, if the solution contains UnitTests
    /// </summary>
    protected virtual bool UnitTestsAvailable => Solution.AllProjects.Any(q => IsUnitTestProject(q.Name));

    [Parameter("Configuration to build - Default is 'Debug' (local) or 'Release' (server)")]
    public Configuration Configuration = IsLocalBuild ? Configuration.Debug : Configuration.Release;

    [Solution]
    public Solution Solution { get; } = null;

    #region Targets

    Target Clean => _ => _
        .Before(Restore)
        .Executes(() =>
        {
            SourceDirectory.GlobDirectories("**/bin", "**/obj").ForEach(q => q.DeleteDirectory());
        });

    Target Restore => _ => _
        .Executes(() =>
        {
            MSBuild(_ => _
            .SetTargetPath(Solution)
            .SetTargets("Restore")
            .SetVerbosity(MSBuildVerbosity.Quiet));
        });

    Target Compile => _ => _
        .DependsOn(Restore)
        .Executes(() =>
        {
            MSBuild(s => s
                .SetTargetPath(Solution)
                .SetTargets("Build")
                .SetConfiguration(Configuration)
                .SetMaxCpuCount(Environment.ProcessorCount)
                .SetVerbosity(MSBuildVerbosity.Quiet)
                .SetNodeReuse(IsLocalBuild));
        });
    #endregion
}
