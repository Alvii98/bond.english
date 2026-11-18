document.addEventListener('DOMContentLoaded', () => {
  const navItems = Array.from(document.querySelectorAll('.bond-nav a[href^="#"]'))
    .map(link => ({link, section: document.getElementById(link.getAttribute('href').slice(1))}))
    .filter(item => item.section)

  if (!navItems.length) return

  let frameId = 0
  let currentActiveItem = null
  const updateCurrentLink = () => {
    if (frameId) return

    frameId = window.requestAnimationFrame(() => {
      frameId = 0

      const header = document.querySelector('.bond-header')
      const marker = window.scrollY + (header ? header.offsetHeight : 0) + window.innerHeight * 0.3
      let activeItem = null

      for (const item of navItems) {
        const sectionTop = item.section.getBoundingClientRect().top + window.scrollY
        if (sectionTop > marker) break
        activeItem = item
      }

      if (activeItem !== currentActiveItem) {
        currentActiveItem = activeItem

        navItems.forEach(({ link, section }) => {
          if (activeItem && section === activeItem.section) {
            link.setAttribute('aria-current', 'location')
          } else {
            link.removeAttribute('aria-current')
          }
        })

        if (activeItem) {
          const nav = activeItem.link.closest('.bond-nav')
          if (nav && nav.scrollWidth > nav.clientWidth) {
            const navRect = nav.getBoundingClientRect()
            const linkRect = activeItem.link.getBoundingClientRect()
            const navLeft = navRect.left + nav.clientLeft
            const navRight = navLeft + nav.clientWidth
            let scrollLeft = nav.scrollLeft

            if (linkRect.left < navLeft) {
              scrollLeft += linkRect.left - navLeft
            } else if (linkRect.right > navRight) {
              scrollLeft += linkRect.right - navRight
            }

            if (scrollLeft !== nav.scrollLeft) {
              nav.scrollTo({ left: scrollLeft, behavior: 'smooth' })
            }
          }
        }
      }
    })
  }

  updateCurrentLink()
  window.addEventListener('scroll', updateCurrentLink, { passive: true })
  window.addEventListener('resize', updateCurrentLink)
})
