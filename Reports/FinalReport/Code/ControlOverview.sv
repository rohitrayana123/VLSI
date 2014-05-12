always_comb begin 
	outputs = default_outputs;
	case(state)
		fetch:	
			case(stateSub) ... endcase
		execute:
			case(stateSub)
				cycle4: 
					case(Opcode)
						OPS: ...
						BRANCH:		case(BranchCode)	...	endcase
						INTERRUPT:	case(BranchCode)	... endcase
					endcase 
				cycle0:	case(Opcode) OPS: ... 	endcase
				cycle1: case(Opcode) OPS: ... 	endcase
				cycle2: 
					case(Opcode)
						OPS: ... 
						INTERRUPT: case(BranchCode)	...	endcase
					endcase  
				cycle3: 
					case(Opcode)
						OPS: ...
						INTERRUPT: case(BranchCode)	...	endcase
					endcase
		interrupt:
			case(stateSub) ... endcase
	endcase
end
