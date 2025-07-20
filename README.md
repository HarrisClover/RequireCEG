# RequireCEG-From Idea to Review‑Ready Requirements

> Have a rough concept, a few bullet points, or a stream-of-consciousness product idea? RequireCEG helps you **clarify, organize, and elaborate your input into a detailed, review-ready software requirements blueprint**—long before anyone writes a line of code.

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)  [![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org)

RequireCEG is a neuro‑symbolic collaboration agent that *thinks like an engineer* to automatically generate, elicit, and self‑review software requirements.

> **🚧 Project Status:** We are currently cleaning up the codebase and will release core components incrementally. Stay tuned!

---

## Table of Contents

* [Demo](#demo)
* [Datasets](#datasets)
* [Method Outputs](#method-outputs)
* [License](#license)

---

## 📽️ Demo
✨**What you get:**
1. **Generation Walkthrough** – watch how a high-level description is incrementally expanded into structured requirement logic.


https://github.com/user-attachments/assets/3c46d5e2-a10a-4aac-bb8e-e7534a0bb762


2. **Sample Output Spec** – explore the detailed artifact produced from that process.


https://github.com/user-attachments/assets/a68ff539-b728-40ad-87d8-632c8ce36740

| Artifact           | File                                           |
| ------------------ | ---------------------------------------------- |
| 🎥 **Full Demo Video**  | [`RequireCEG-Demo.mp4`](./RequireCEG-Demo.mp4) |
| 📄 **Demo Output** | [`Demo_Output`](./Demo_Output)                 |

---

## 📂 Datasets

| Dataset         | Path                       | Contents                                                             |
| --------------- | -------------------------- | -------------------------------------------------------------------- |
| **RGPair**      | `Dataset/RGPair.json`      | 40 repositories · 413 feature files · 40 natural‑language narratives |
| **Mini‑RG**     | `Dataset/Mini-RG.json`     | 12 feature files · 12 natural‑language narratives                    |
| **Pub‑website** | `Dataset/Pub-website.json` | 5 public websites · 5 narratives · 96 primary functions              |

---

## Methods Outputs Comparison

<details>
<summary>Directory tree</summary>

```text
Methods Output/
├── AgileGen_Outputs/
│   ├── RGPair/
│   └── Mini-RG/
├── CoT_Outputs/
│   ├── RGPair/
│   └── Mini-RG/
├── Gemini-2.5-pro_Outputs/
│   ├── RGPair/
│   └── Mini-RG/
├── MetaGPT_Outputs/
│   ├── RGPair/
│   └── Mini-RG/
├── o3-mini_Outputs/
│   ├── RGPair/
│   └── MiniRG/
├── RequireLite_Outputs/
│   ├── RGPair/
│   └── Mini-RG/
└── RequireCEG_Outputs/
    ├── RGPair/
    └── Mini-RG/
```

</details>

---

## 📜 Citation

If you use **RequireCEG** in your research, please cite our paper:

```bibtex
@inproceedings{xxxx,
  title     = {RequireCEG: Neuro‑Symbolic Collaboration for Automated Software Requirement Engineering},
  author    = {xxxx},
  booktitle = {xxxx},
  year      = {2025},
  publisher = {ACM},
}
```

---

📝 ## License

This project is licensed under the [Apache License 2.0](LICENSE).
