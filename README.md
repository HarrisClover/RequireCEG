# RequireCEG

> **Think Like an Engineer:** A Neuro‑Symbolic Collaboration Agent for Generative Software Requirements Elicitation and Self‑Review

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)  [![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org)

RequireCEG is a neuro‑symbolic collaboration agent that *thinks like an engineer* to automatically generate, elicit, and self‑review software requirements.

> **🚧 Project Status:** The codebase is currently being cleaned up; core components will be released incrementally. Stay tuned!

---

## Table of Contents

* [Demo](#demo)
* [Datasets](#datasets)
* [Method Outputs](#method-outputs)
* [License](#license)

---
<video src="[https://github.com/HarrisClover/RequireCEG/blob/main/RequireCEG-Demo.mp4](https://github.com/HarrisClover/RequireCEG/blob/main/RequireCEG-Demo.mp4)"
       controls
       muted
       >
</video>
---

## Demo

| Artifact           | File                                           |
| ------------------ | ---------------------------------------------- |
| 🎥 **Demo Video**  | [`RequireCEG-Demo.mp4`](./RequireCEG-Demo.mp4) |
| 📄 **Demo Output** | [`Demo_Output`](./Demo_Output)                 |

<details>
<summary>Directory tree</summary>

```text
.
├── RequireCEG-Demo.mp4
└── Demo_Output/
    └── ...
```

</details>

---

## Datasets

| Dataset         | Path                       | Contents                                                             |
| --------------- | -------------------------- | -------------------------------------------------------------------- |
| **RGPair**      | `Dataset/RGPair.json`      | 40 repositories · 413 feature files · 40 natural‑language narratives |
| **Mini‑RG**     | `Dataset/Mini-RG.json`     | 12 feature files · 12 natural‑language narratives                    |
| **Pub‑website** | `Dataset/Pub-website.json` | 5 public websites · 5 narratives · 96 primary functions              |

---

## Method Outputs

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

## License

This project is licensed under the [Apache License 2.0](LICENSE).
