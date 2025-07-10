RequireCEG EXPERIMENT **README**

Think Like an Engineer: A Neuro-Symbolic collaboration Agent for Generative Software Requirements Elicitation and Self-Review
**Demo Video**: RequireCEG-Demo.mp4  **Demo Output**: Demo_Output

**Dataset**
1. RGPair Dataset\RGPair.json - 40 repositories, 413 feature files with 40 natural language narratives.
2. Mini-RG Dataset\Mini-RG.json - 12 feature with 12 natural language narratives.
3. Pub-website Dataset\Pub-website.json - five public website with 5 narratives and 96 primary functions.

The file contains the output of the different methods and the experimental results:
**Output results** (Methods Output)
1. Output of the AgileGen method on two datasets
    - Methods Output\AgileGen_Outputs\RGPair
    - Methods Output\AgileGen_Outputs\Mini-RG
2. Output of the CoT method on two datasets
    - Methods Output\CoT_Outputs\RGPair
    - Methods Output\CoT_Outputs\Mini-RG
3. Output of the Gemini-2.5-pro method on two datasets
    - Methods Output\Gemini-2.5-pro_Outputs\RGPair
    - Methods Output\Gemini-2.5-pro_Outputs\Mini-RG
4. Output of the MetaGPT method on two datasets
    - Methods Output\MetaGPT_Outputs\RGPair
    - Methods Output\MetaGPT_Outputs\Mini-RG
5. Output of the o3-mini method on two datasets
    - Methods Output\o3-mini_Outputs\RGPair
    - Methods Output\o3-mini_Outputs\MiniRG
6. Output of the RequireLite method on two datasets
    - Methods Output\RequireLite_Outputs\RGPair
    - Methods Output\RequireLite_Outputs\Mini-RG
7. Output of the RequireCEG method on two datasets
    - Methods Output\RequireCEG_Outputs\RGPair
    - Methods Output\RequireCEG_Outputs\Mini-RG

**Experimental results**:
1. Gherkin Keyword Statistics
    - AgileGen: 
        1) Gherkin Keyword Statistics\RGPair\AgileGen
        2) Gherkin Keyword Statistics\Mini-RG\AgileGen
    - CoT: 
        1) Gherkin Keyword Statistics\RGPair\CoT
        2) Gherkin Keyword Statistics\Mini-RG\CoT
    - Gemini-2.5-pro: 
        1) Gherkin Keyword Statistics\RGPair\Gemini-2.5-pro
        2) Gherkin Keyword Statistics\Mini-RG\Gemini-2.5-pro
    - o3-mini:
        1) Gherkin Keyword Statistics\RGPair\o3-mini
        2) Gherkin Keyword Statistics\Mini-RG\o3-mini
    - RequireLite:
        1) Gherkin Keyword Statistics\RGPair\RequireLite
        2) Gherkin Keyword Statistics\Mini-RG\RequireLite
    - RequireCEG:
        1) Gherkin Keyword Statistics\RGPair\RequireCEG
        2) Gherkin Keyword Statistics\Mini-RG\RequireCEG

2. Syntactic Accuracy Results
    - AgileGen: 
        1) Syntactic Accuracy_Results\RGPair\AgileGen
        2) Syntactic Accuracy_Results\Mini-RG\AgileGen
    - CoT: 
        1) Syntactic Accuracy_Results\RGPair\CoT
        2) Syntactic Accuracy_Results\Mini-RG\CoT
    - Gemini-2.5-pro: 
        1) Syntactic Accuracy_Results\RGPair\Gemini-2.5-pro
        2) Syntactic Accuracy_Results\Mini-RG\Gemini-2.5-pro
    - o3-mini:
        1) Syntactic Accuracy_Results\RGPair\o3-mini
        2) Syntactic Accuracy_Results\Mini-RG\o3-mini
    - RequireLite:
        1) Syntactic Accuracy_Results\RGPair\RequireLite
        2) Syntactic Accuracy_Results\Mini-RG\RequireLite
    - RequireCEG:
        1) Syntactic Accuracy_Results\RGPair\RequireCEG
        2) Syntactic Accuracy_Results\Mini-RG\RequireCEG

3. Readability Results
    - AgileGen: 
        1) Readability_Results\RGPair\AgileGen.json
        2) Readability_Results\Mini-RG\AgileGen.json
    - CoT: 
        1) Readability_Results\RGPair\CoT.json
        2) Readability_Results\Mini-RG\CoT.json
    - Gemini-2.5-pro: 
        1) Readability_Results\RGPair\Gemini-2.5-pro.json
        2) Readability_Results\Mini-RG\Gemini-2.5-pro.json
    - MetaGPT:
        1) Readability_Results\RGPair\MetaGPT.json
        2) Readability_Results\Mini-RG\MetaGPT.json
    - o3-mini:
        1) Readability_Results\RGPair\o3-mini.json
        2) Readability_Results\Mini-RG\o3-mini.json
    - RequireLite:
        1) Readability_Results\RGPair\RequireLite.json
        2) Readability_Results\Mini-RG\RequireLite.json
    - RequireCEG:
        1) Readability_Results\RGPair\RequireCEG.json
        2) Readability_Results\Mini-RG\RequireCEG.json

4. INVEST Results
    - AgileGen: 
        1) INVEST_Results\RGPair\Dataset1_AgileGen
        2) INVEST_Results\Mini-RG\Dataset2_AgileGen
    - CoT: 
        1) INVEST_Results\RGPair\Dataset1_CoT
        2) INVEST_Results\Mini-RG\Dataset2_CoT
    - Gemini-2.5-pro: 
        1) INVEST_Results\RGPair\Dataset1_Gemini-2.5-pro
        2) INVEST_Results\Mini-RG\Dataset2_Gemini-2.5-pro
    - MetaGPT(PRD):
        1) INVEST_Results\RGPair\Dataset1_MetaGPT
        2) INVEST_Results\Mini-RG\Dataset2_MetaGPT
    - MetaGPT(Story):
        1) INVEST_Results\RGPair\Dataset1_MetaGPT_Story
        2) INVEST_Results\Mini-RG\Dataset2_MetaGPT_Story
    - o3-mini:
        1) INVEST_Results\RGPair\Dataset1_o3-mini
        2) INVEST_Results\Mini-RG\Dataset2_o3-mini
    - RequireLite:
        1) INVEST_Results\RGPair\Dataset1_RequireLite
        2) INVEST_Results\Mini-RG\Dataset2_RequireLite
    - RequireCEG:
        1) INVEST_Results\RGPair\Dataset1_RequireCEG
        2) INVEST_Results\Mini-RG\Dataset2_RequireCEG
    - Evaluation metrics statistics and IVEST evaluation metrics graph
        1) INVEST_Results\RGPair\D1_count_INVEST.json; INVEST_Results\RGPair\fig_D1_INVEST
        2) INVEST_Results\Mini-RG\D2_count_INVEST.json; INVEST_Results\Mini-RG\fig_D2_INVEST

5. Fundiv Results
    - AgileGen: 
        1) Fundiv_Results\RGPair\Dataset1_AgileGen
        2) Fundiv_Results\Mini-RG\Dataset2_AgileGen
    - CoT: 
        1) Fundiv_Results\RGPair\Dataset1_CoT
        2) Fundiv_Results\Mini-RG\Dataset2_CoT
    - Gemini-2.5-pro: 
        1) Fundiv_Results\RGPair\Dataset1_Gemini-2.5-pro
        2) Fundiv_Results\Mini-RG\Dataset2_Gemini-2.5-pro
    - MetaGPT:
        1) Fundiv_Results\RGPair\Dataset1_MetaGPT
        2) Fundiv_Results\Mini-RG\Dataset2_MetaGPT
    - o3-mini:
        1) Fundiv_Results\RGPair\Dataset1_o3-mini
        2) Fundiv_Results\Mini-RG\Dataset2_o3-mini
    - RequireLite:
        1) Fundiv_Results\RGPair\Dataset1_RequireLite
        2) Fundiv_Results\Mini-RG\Dataset2_RequireLite
    - RequireCEG:
        1) Fundiv_Results\RGPair\Dataset1_RequireCEG
        2) Fundiv_Results\Mini-RG\Dataset2_RequireCEG
    - Fundiv evaluation metrics graph
        1) Fundiv_Results\RGPair\Fundiv_RGPair.png
        2) Fundiv_Results\Mini-RG\Fundiv_MiniRG.png

6. Consist Results
    - AgileGen: 
        1) Consist_Results\RGPair\Dataset1_AgileGen
        2) Consist_Results\Mini-RG\Dataset2_AgileGen
    - CoT: 
        1) Consist_Results\RGPair\Dataset1_CoT
        2) Consist_Results\Mini-RG\Dataset2_CoT
    - Gemini-2.5-pro: 
        1) Consist_Results\RGPair\Dataset1_Gemini-2.5-pro
        2) Consist_Results\Mini-RG\Dataset2_Gemini-2.5-pro
    - MetaGPT(PRD):
        1) Consist_Results\RGPair\Dataset1_MetaGPT
        2) Consist_Results\Mini-RG\Dataset2_MetaGPT
    - MetaGPT(Story):
        1) Consist_Results\RGPair\Dataset1_MetaGPT_Story
        2) Consist_Results\Mini-RG\Dataset2_MetaGPT_Story
    - o3-mini:
        1) Consist_Results\RGPair\Dataset1_o3-mini
        2) Consist_Results\Mini-RG\Dataset2_o3-mini
    - RequireLite:
        1) Consist_Results\RGPair\Dataset1_RequireLite
        2) Consist_Results\Mini-RG\Dataset2_RequireLite
    - RequireCEG:
        1) Consist_Results\RGPair\Dataset1_RequireCEG
        2) Consist_Results\Mini-RG\Dataset2_RequireCEG
    - Total evaluation metrics graph
        Consist_Results\consis_detail.png

7. Field Study
    Generation Results:
        - Field Study\CourtAid
        - Field Study\Image Prompt
        - Field Study\Lyrebird Health
        - Field Study\Notebook LM
        - Field Study\STORM
    Human Test Results:
        - Field Study\Test Results table.xlsx
        - Field Study\Test Results table.png