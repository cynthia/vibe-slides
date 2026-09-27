# Citation Audit

Note: This report audits every academic citation referenced in [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:668). Because the slide references use `et al.`, [master-outline.md](/mnt/ssd2/finb/harnesses-and-multi-agents/master-outline.md:590) was also checked to verify the full author lists.

## Summary Findings

- `Lost in the Middle: How Language Models Use Long Contexts` is not in the current deck reference block, but the old exclusion rationale in [master-outline.md](/mnt/ssd2/finb/harnesses-and-multi-agents/master-outline.md:609) was inaccurate. ACL Anthology lists it as a 2024 TACL paper, so it should be treated as a valid top-tier journal source rather than rejected on venue grounds.
- The current deck uses grouped `References: [n]` footers effectively, but those are too weak when a slide names a paper, method, or benchmark in body text. The first such mention should use `Title (Author et al., Year)` inline, with the numbered reference retained as supporting bibliography.
- The deck reference slides in [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:646) still omit clickable paper links. Every current reference in this audit has a resolvable primary-source link, so the deck is missing links even though the audit is not.

## Recommended Inline First Mentions

- `[1]` [Attention Is All You Need](https://proceedings.neurips.cc/paper/7181-attention-is-all-you-need) `(Vaswani et al., 2017)`
- `[2]` [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](https://proceedings.neurips.cc/paper/2022/hash/9d5609613524ecf4f15af0f7b31abca4-Abstract-Conference.html) `(Wei et al., 2022)`
- `[3]` [Self-Consistency Improves Chain of Thought Reasoning in Language Models](https://openreview.net/forum?id=1PL1NIMMrw) `(Wang et al., 2023)`
- `[4]` [Least-to-Most Prompting Enables Complex Reasoning in Large Language Models](https://openreview.net/forum?id=WZH7099tgfM) `(Zhou et al., 2023)`
- `[5]` [ReAct: Synergizing Reasoning and Acting in Language Models](https://openreview.net/forum?id=WE_vluYUL-X) `(Yao et al., 2023)`
- `[6]` [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://openreview.net/forum?id=5Xc1ecxO1h) `(Yao et al., 2023)`
- `[7]` [LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding](https://aclanthology.org/2024.acl-long.172/) `(Bai et al., 2024)`
- `[8]` [AgentBench: Evaluating LLMs as Agents](https://openreview.net/forum?id=zAdUB0aCTQ) `(Liu et al., 2024)`
- `[9]` [WebArena: A Realistic Web Environment for Building Autonomous Agents](https://openreview.net/forum?id=oKn9c6ytLx) `(Zhou et al., 2024)`
- `[10]` [More Agents Is All You Need](https://openreview.net/forum?id=bgzUSZ8aeg) `(Li et al., 2024)`
- `[11]` [LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion](https://aclanthology.org/2023.acl-long.792/) `(Jiang et al., 2023)`
- `[12]` [Mixture-of-Agents Enhances Large Language Model Capabilities](https://openreview.net/forum?id=h0ZfDIrj7T) `(Wang et al., 2025)`
- `[13]` [LLMs Get Lost In Multi-Turn Conversation](https://openreview.net/forum?id=VKGTGGcwl6) `(Laban et al., 2026)`

## Citation Quality Flags

- Missing links in deck: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:646) lists titles and venues only; it does not expose a link for any reference.
- Weak citations in body text: slides that name `LongBench`, `Least-to-Most`, `Tree of Thoughts`, `Self-Consistency`, `More Agents Is All You Need`, `LLM-Blender`, `Mixture-of-Agents`, `Chain-of-Thought`, and `ReAct` currently use grouped footer references instead of first-mention inline citations.
- Weak support grouping: `AgentBench` and `WebArena` are cited as grouped support on the decomposition slide, but neither paper is explained inline, so the reader cannot tell what evidence each one contributes.
- Inaccurate venue treatment: the prior note that `Lost in the Middle` was excluded because of venue constraints was incorrect; TACL is the ACL flagship journal, not a weak or disallowed venue.

## [1] Attention Is All You Need
- Authors: Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, and Illia Polosukhin
- Venue: Advances in Neural Information Processing Systems 30 (NeurIPS 2017)
- URL: https://proceedings.neurips.cc/paper/7181-attention-is-all-you-need
- Status: CORRECTED
- Notes: Paper exists and metadata matches. Corrected the author spelling to `Łukasz Kaiser` in the supporting outline reference block.

## [2] Chain-of-Thought Prompting Elicits Reasoning in Large Language Models
- Authors: Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Brian Ichter, Fei Xia, Ed H. Chi, Quoc V. Le, and Denny Zhou
- Venue: Advances in Neural Information Processing Systems 35 (NeurIPS 2022)
- URL: https://proceedings.neurips.cc/paper/2022/hash/9d5609613524ecf4f15af0f7b31abca4-Abstract-Conference.html
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## [3] Self-Consistency Improves Chain of Thought Reasoning in Language Models
- Authors: Xuezhi Wang, Jason Wei, Dale Schuurmans, Quoc V. Le, Ed H. Chi, Sharan Narang, Aakanksha Chowdhery, and Denny Zhou
- Venue: ICLR 2023
- URL: https://openreview.net/forum?id=1PL1NIMMrw
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## [4] Least-to-Most Prompting Enables Complex Reasoning in Large Language Models
- Authors: Denny Zhou, Nathanael Schärli, Le Hou, Jason Wei, Nathan Scales, Xuezhi Wang, Dale Schuurmans, Claire Cui, Olivier Bousquet, Quoc V. Le, and Ed H. Chi
- Venue: ICLR 2023
- URL: https://openreview.net/forum?id=WZH7099tgfM
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## [5] ReAct: Synergizing Reasoning and Acting in Language Models
- Authors: Shunyu Yao, Jeffrey Zhao, Dian Yu, Nan Du, Izhak Shafran, Karthik R. Narasimhan, and Yuan Cao
- Venue: ICLR 2023
- URL: https://openreview.net/forum?id=WE_vluYUL-X
- Status: CORRECTED
- Notes: Paper exists and metadata matches. Corrected the supporting outline author list to include `Karthik R. Narasimhan`.

## [6] Tree of Thoughts: Deliberate Problem Solving with Large Language Models
- Authors: Shunyu Yao, Dian Yu, Jeffrey Zhao, Izhak Shafran, Thomas L. Griffiths, Yuan Cao, and Karthik R. Narasimhan
- Venue: NeurIPS 2023
- URL: https://openreview.net/forum?id=5Xc1ecxO1h
- Status: CORRECTED
- Notes: Paper exists and metadata matches. Corrected the supporting outline author list to include `Karthik R. Narasimhan`.

## [7] LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding
- Authors: Yushi Bai, Xin Lv, Jiajie Zhang, Hongchang Lyu, Jiankai Tang, Zhidian Huang, Zhengxiao Du, Xiao Liu, Aohan Zeng, Lei Hou, Yuxiao Dong, Jie Tang, and Juanzi Li
- Venue: Proceedings of the 62nd Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers), 2024
- URL: https://aclanthology.org/2024.acl-long.172/
- Status: VERIFIED
- Notes: DOI `10.18653/v1/2024.acl-long.172`. Matches the checked-in reference block.

## [8] AgentBench: Evaluating LLMs as Agents
- Authors: Xiao Liu, Hao Yu, Hanchen Zhang, Yifan Xu, Xuanyu Lei, Hanyu Lai, Yu Gu, Hangliang Ding, Kaiwen Men, Kejuan Yang, Shudan Zhang, Xiang Deng, Aohan Zeng, Zhengxiao Du, Chenhui Zhang, Sheng Shen, Tianjun Zhang, Yu Su, Huan Sun, Minlie Huang, Yuxiao Dong, and Jie Tang
- Venue: ICLR 2024
- URL: https://openreview.net/forum?id=zAdUB0aCTQ
- Status: CORRECTED
- Notes: Removed an extra nonexistent author entry, `Yuxian Gu`, from the supporting outline reference block.

## [9] WebArena: A Realistic Web Environment for Building Autonomous Agents
- Authors: Shuyan Zhou, Frank F. Xu, Hao Zhu, Xuhui Zhou, Robert Lo, Abishek Sridhar, Xianyi Cheng, Tianyue Ou, Yonatan Bisk, Daniel Fried, Uri Alon, and Graham Neubig
- Venue: ICLR 2024
- URL: https://openreview.net/forum?id=oKn9c6ytLx
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## [10] More Agents Is All You Need
- Authors: Junyou Li, Qin Zhang, Yangbin Yu, Qiang Fu, and Deheng Ye
- Venue: Transactions on Machine Learning Research (TMLR), 2024
- URL: https://openreview.net/forum?id=bgzUSZ8aeg
- Status: CORRECTED
- Notes: The deck referenced the preprint form. Corrected the deck and supporting outline to the accepted TMLR version, which satisfies the allowed-venue constraint.

## [11] LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion
- Authors: Dongfu Jiang, Xiang Ren, and Bill Yuchen Lin
- Venue: Proceedings of the 61st Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers), 2023
- URL: https://aclanthology.org/2023.acl-long.792/
- Status: VERIFIED
- Notes: DOI `10.18653/v1/2023.acl-long.792`. Matches the checked-in reference block.

## [12] Mixture-of-Agents Enhances Large Language Model Capabilities
- Authors: Junlin Wang, Jue Wang, Ben Athiwaratkun, Ce Zhang, and James Zou
- Venue: ICLR 2025
- URL: https://openreview.net/forum?id=h0ZfDIrj7T
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## [13] LLMs Get Lost In Multi-Turn Conversation
- Authors: Philippe Laban, Hiroaki Hayashi, Yingbo Zhou, and Jennifer Neville
- Venue: ICLR 2026
- URL: https://openreview.net/forum?id=VKGTGGcwl6
- Status: VERIFIED
- Notes: Matches the checked-in reference block.

## Lost in the Middle venue check
- Paper: [Lost in the Middle: How Language Models Use Long Contexts](https://aclanthology.org/2024.tacl-1.9/)
- ACL citation: Nelson F. Liu, Kevin Lin, John Hewitt, Ashwin Paranjape, Michele Bevilacqua, Fabio Petroni, and Percy Liang. 2024. *Lost in the Middle: How Language Models Use Long Contexts*. Transactions of the Association for Computational Linguistics, 12:157-173.
- Verdict: VALID TOP-TIER JOURNAL PAPER
- Notes: The checked-in outline note that says the paper was excluded under venue constraints is inaccurate. ACL Anthology lists it as a TACL paper in Volume 12, with DOI `10.1162/tacl_a_00638`. If the deck wants to support long-context position-bias claims, this paper is in scope and stronger than citing only LongBench.

## Inline first-mention recommendations

These papers are named or directly invoked in slide body text and should be cited inline on first mention in the form `Title (Author et al., Venue Year) [n]`, ideally with the title hyperlinked to the paper URL.

- [1] [Attention Is All You Need](https://proceedings.neurips.cc/paper/7181-attention-is-all-you-need) (Vaswani et al., NeurIPS 2017)
  - First mention candidate: `The Transformer Makes It Work` in [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:97)
- [7] [LongBench: A Bilingual, Multitask Benchmark for Long Context Understanding](https://aclanthology.org/2024.acl-long.172/) (Bai et al., ACL 2024)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:278)
- [13] [LLMs Get Lost In Multi-Turn Conversation](https://openreview.net/forum?id=VKGTGGcwl6) (Laban et al., ICLR 2026)
  - First claim-level use: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:294)
- [4] [Least-to-Most Prompting Enables Complex Reasoning in Large Language Models](https://openreview.net/forum?id=WZH7099tgfM) (Zhou et al., ICLR 2023)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:319)
- [6] [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://openreview.net/forum?id=5Xc1ecxO1h) (Yao et al., NeurIPS 2023)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:319)
- [3] [Self-Consistency Improves Chain of Thought Reasoning in Language Models](https://openreview.net/forum?id=1PL1NIMMrw) (Wang et al., ICLR 2023)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:375)
- [10] [More Agents Is All You Need](https://openreview.net/forum?id=bgzUSZ8aeg) (Li et al., TMLR 2024)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:381)
- [11] [LLM-Blender: Ensembling Large Language Models with Pairwise Ranking and Generative Fusion](https://aclanthology.org/2023.acl-long.792/) (Jiang et al., ACL 2023)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:403)
- [12] [Mixture-of-Agents Enhances Large Language Model Capabilities](https://openreview.net/forum?id=h0ZfDIrj7T) (Wang et al., ICLR 2025)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:404)
- [2] [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](https://proceedings.neurips.cc/paper/2022/hash/9d5609613524ecf4f15af0f7b31abca4-Abstract-Conference.html) (Wei et al., NeurIPS 2022)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:419)
- [5] [ReAct: Synergizing Reasoning and Acting in Language Models](https://openreview.net/forum?id=WE_vluYUL-X) (Yao et al., ICLR 2023)
  - First explicit title mention: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:424)

## Flags

- Missing links in the deck source: the reference slide in [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:646) lists titles and venues, but none of the entries include paper URLs. The citation audit has URLs for [1]-[13], so the deck can be upgraded without more research.
- Missing long-context paper: `Lost in the Middle` is absent from the numbered references even though the deck makes position-bias and buried-context claims on [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:262) and [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:273). This is the strongest missing citation.
- Weak citation on `Single-Agent Harnesses Hit a Ceiling`: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:250) cites [7] and [13], but [7] LongBench is only indirect support for the broader planning and role-bottleneck claim.
- Weak citation on `One Context Window Is Not a Plan`: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:267) cites only [7], but the specific claim that important facts get buried far apart is better matched by `Lost in the Middle`.
- Weak citation on `Long Inputs Degrade Attention in Practice`: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:282) cites only [7], but the `needle` and position-sensitivity language maps more directly to `Lost in the Middle`.
- Weak citation on `Decomposition Is the Escape Hatch`: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:329) cites [8] AgentBench and [9] WebArena, but neither paper is named or clearly tied to the decomposition claim in the slide body. Either mention those benchmarks explicitly or drop them from this slide.
- Weak citation on `Small Contexts Can Beat One Long Context`: [deck.typ](/mnt/ssd2/finb/harnesses-and-multi-agents/deck.typ:445) cites [7], [10], [11], and [12], but the slide body does not attribute the small-context claim to any named paper. This is acceptable as a footer bibliography, but weak by the stricter first-mention standard.
- Inaccurate venue treatment in the outline: [master-outline.md](/mnt/ssd2/finb/harnesses-and-multi-agents/master-outline.md:609) previously treated `Lost in the Middle` as venue-ineligible. That should not be carried forward.
