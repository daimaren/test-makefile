SRC_FILES:= hello.cpp main.cpp  
OBJS:=$(SRC_FILES:.cpp=.o)  
DEPS:=$(OBJS:.o=.d)  
TARGET:=hello.exe  
  
## -MMD 可以用于自动生成头文件依赖关系  
%.o : %.cpp  
	$(CXX) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@"   
  
ifneq "$(MAKECMDGOALS)" "clean"  
-include $(DEPS)  
endif  
      
## 定义可执行文件hello.exe的编译规则      
$(TARGET):  $(OBJS)  
	$(CXX) $(CXXFLAGS)  -o $@ $^ 
