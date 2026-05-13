import { useCallback } from 'react'

export function useElectron() {
  const isDesktop = !!window.electron

  const openFile = useCallback(async (options: any) => {
    if (!isDesktop) return null
    return await window.api.openFile(options)
  }, [isDesktop])

  const saveFile = useCallback(async (options: any) => {
    if (!isDesktop) return null
    return await window.api.saveFile(options)
  }, [isDesktop])

  const readFile = useCallback(async (path: string) => {
    if (!isDesktop) return null
    return await window.api.readFile(path)
  }, [isDesktop])

  const writeFile = useCallback(async (path: string, data: string) => {
    if (!isDesktop) return
    await window.api.writeFile(path, data)
  }, [isDesktop])

  return {
    isDesktop,
    openFile,
    saveFile,
    readFile,
    writeFile
  }
}
