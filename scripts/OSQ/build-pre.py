import os

from SCons.Script import AlwaysBuild


Import("env")


def ZephyrBuildProgram(env):
    env["LDSCRIPT_PATH"] = None
    env.ProcessProgramDeps()
    env.ProcessProjectDeps()

    # append into the beginning a main LD script
    env.Prepend(LINKFLAGS=["-T", "$LDSCRIPT_PATH"])

    # enable "cyclic reference" for linker
    if env.get("LIBS") and env.GetCompilerType() == "gcc":
        env.Prepend(_LIBFLAGS="-Wl,--start-group ")
        env.Append(_LIBFLAGS=" -Wl,--end-group")

    program_pre = env.Program(
        os.path.join("$BUILD_DIR", "firmware-pre"), env["PIOBUILDFILES"],
        LDSCRIPT_PATH=os.path.join("$BUILD_DIR", "zephyros", "linker.cmd")
    )

    # Force execution of offset header target before compiling project sources
    env.Depends(env["PIOBUILDFILES"], env["__ZEPHYR_OFFSET_HEADER_CMD"])


    program = env.Program(
        os.path.join("$BUILD_DIR", env.subst("$PROGNAME")),
        env["PIOBUILDFILES"] + env["_EXTRA_ZEPHYR_PIOBUILDFILES"],
        LDSCRIPT_PATH=os.path.join("$BUILD_DIR", "zephyros", "linker_pass_final.cmd")
    )

    env.Replace(PIOMAINPROG=program)

    AlwaysBuild(
        env.Alias(
            "checkprogsize",
            program,
            env.VerboseAction(env.CheckUploadSize, "Checking size $PIOMAINPROG"),
        )
    )

    print("Building in %s mode" % env.GetBuildType())

    return program

env.AddMethod(ZephyrBuildProgram, "BuildProgram")
