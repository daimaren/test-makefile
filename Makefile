SRC_FILES:= hello.cpp main.cpp  
OBJS:=$(SRC_FILES:.cpp=.o)  
DEPS:=$(OBJS:.o=.d)  
TARGET:=hello.exe  
  
## -MMD ���������Զ�����ͷ�ļ�������ϵ  
%.o : %.cpp  
	$(CXX) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@"   
  
ifneq "$(MAKECMDGOALS)" "clean"  
-include $(DEPS)  
endif  
      
## �����ִ���ļ�hello.exe�ı������      
$(TARGET):  $(OBJS)  
	$(CXX) $(CXXFLAGS)  -o $@ $^ 
