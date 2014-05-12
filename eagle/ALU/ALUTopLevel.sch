<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="7.62" y1="78.74" x2="7.62" y2="68.58" width="0.1524" layer="94"/>
<wire x1="7.62" y1="63.5" x2="7.62" y2="53.34" width="0.1524" layer="94"/>
<wire x1="7.62" y1="53.34" x2="20.32" y2="60.96" width="0.1524" layer="94"/>
<wire x1="20.32" y1="60.96" x2="20.32" y2="71.12" width="0.1524" layer="94"/>
<wire x1="20.32" y1="71.12" x2="7.62" y2="78.74" width="0.1524" layer="94"/>
<wire x1="7.62" y1="68.58" x2="10.16" y2="66.04" width="0.1524" layer="94"/>
<wire x1="10.16" y1="66.04" x2="7.62" y2="63.5" width="0.1524" layer="94"/>
<text x="12.7" y="66.04" size="1.778" layer="94">ALU</text>
<text x="12.7" y="66.04" size="1.778" layer="94">ALU</text>
<text x="22.86" y="66.04" size="1.778" layer="95">ALUOut</text>
<text x="2.54" y="58.42" size="1.778" layer="95">B</text>
<text x="2.54" y="73.66" size="1.778" layer="95">A</text>
<text x="12.7" y="81.28" size="1.778" layer="95">OpCode</text>
<text x="13.462" y="77.724" size="1.778" layer="91">5</text>
<text x="18.542" y="74.93" size="1.778" layer="91">4</text>
<text x="17.78" y="78.74" size="1.778" layer="95">imm</text>
</plain>
<instances>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="7.62" y1="73.66" x2="2.54" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="7.62" y1="58.42" x2="2.54" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="20.32" y1="66.04" x2="22.86" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<wire x1="12.7" y1="75.692" x2="12.7" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="17.78" y1="72.39" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="11.684" y1="77.978" x2="13.462" y2="79.756" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="17.018" y1="75.184" x2="18.796" y2="76.962" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
