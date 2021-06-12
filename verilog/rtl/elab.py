
"""
VCS Elaboration  
"""
import os 

cmd = f"""
mkdir -p sim && \
  cd sim &&  \
  vcs -full64 +lint=all +v2k +systemverilogext+sv \
  ../user_analog_project_wrapper.v \
  +define+USE_POWER_PINS \
  -top user_analog_project_wrapper && \
  ./simv 
"""

os.system(cmd)

