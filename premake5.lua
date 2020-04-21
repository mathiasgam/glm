project "glm"
    kind "StaticLib"
    language "C"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }
    
	filter "system:windows"
        buildoptions { "-std=c11", "-lgdi32" }
        --systemversion "10.0.17134.0"
        staticruntime "On"
        
        files
        {
            "glm/*.hpp",
            "glm/*.cpp",
            "glm/*.inl"
        }

		defines 
		{ 
            
		}
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
