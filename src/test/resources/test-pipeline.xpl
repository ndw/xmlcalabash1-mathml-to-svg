<p:declare-step version='1.0' name="main"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                xmlns:svg="http://www.w3.org/2000/svg"
                exclude-inline-prefixes="c cx svg">
<p:output port="result"/>

<p:import href="http://xmlcalabash.com/extension/steps/mathml-to-svg.xpl"/>

<cx:mathml-to-svg>
  <p:input port="source">
    <p:inline>
      <math xmlns="http://www.w3.org/1998/Math/MathML">
        <apply>
          <int/>
          <bvar>
            <ci>x</ci>
          </bvar>
          <interval>
            <ci>a</ci>
            <ci>b</ci>
          </interval>
          <apply><cos/>
          <ci>x</ci>
          </apply>
        </apply>
      </math>
    </p:inline>
  </p:input>
  <p:input port="parameters">
    <p:empty/>
  </p:input>
</cx:mathml-to-svg>

<p:choose>
  <p:when test="/svg:svg">
    <p:identity>
      <p:input port="source">
        <p:inline><c:result>PASS</c:result></p:inline>
      </p:input>
    </p:identity>
  </p:when>
  <p:otherwise>
    <p:error code="FAIL">
      <p:input port="source">
        <p:inline><message>Did not find expected text.</message></p:inline>
      </p:input>
    </p:error>
  </p:otherwise>
</p:choose>

</p:declare-step>
